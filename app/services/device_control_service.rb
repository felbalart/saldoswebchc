class DeviceControlService

  UUID = 'htc1'
  # MTQQ_HOST = '127.0.0.1'# 'mqtt.flespi.io' #'test.mosquitto.org'
  MTQQ_PORT = 1883
  MTQQ_HOST = 'mqtt.flespi.io'
  # MTQQ_PORT = 29961
  MTQQ_USERNAME = ENV.fetch('MQTT_USERNAME')
  MTQQ_PASSWORD = ''

  def initialize
    puts "initializing device #{UUID}..."
    publish('auto_focus', 1)
    publish('dim_screen', 0)
    client.subscribe(topic_base + '#')
  end

  def get_status
    catch_message 'status'
  end

  def get_battery
    catch_message 'battery'
  end

  def take_image
    publish 'shutter'
    catch_message 'image'
  end

  def disconnect
    client.disconnect
  end

  private

  def topic_base
    "camera/#{UUID}/"
  end

  def publish(action, payload = nil)
    topic = topic_base + action
    client.publish(topic, payload)
  end

  def catch_message(action)
    Timeout::timeout(30) do
      client.get do |topic, message|
        puts "Received: #{topic}: #{message[0..100]}"
        return message if topic.ends_with? action
      end
    end
  end

  def client
    @client ||= MQTT::Client.connect(host: MTQQ_HOST, port: MTQQ_PORT, username: MTQQ_USERNAME, password: MTQQ_PASSWORD)
  end
end
