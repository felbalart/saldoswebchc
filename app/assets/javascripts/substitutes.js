var subAuthor = '';

function addSubstitute(productId) {
  var msg = "Agregar Propuesta Sustituto para\n";
  msg += $('.product_name#1').text();
  msg += "\n\n Usar formato <codigo> <nombre>\n";
  msg += "Por ejemplo así: \n'325394001 SS.Victoria lavabo 52x41 cm. c/ jgo. fijacion'";
  var subName = prompt(msg);
  if(subName == null) return;
  if(subName.length < 9) {
    return alert('Valor ingresado "'+subName+'" es muy corto')
  }
  var msg2 = "Ahora ingresa tu nombre";
  msg2 += "\n\n Usar formato <N.> <Apellido>\n";
  msg2 += "Por ejemplo así: \n'A. Einstein'";
  subAuthor = prompt(msg2, subAuthor);
  if(subAuthor == null || subAuthor.length < 6)
    return alert('Nombre ingresado no es válido o es muy corto');  
  sendSubstitute(productId, subName, subAuthor);
}

function sendSubstitute(productId, subName, subAuthor) {
    var url = '/substitute';    
    $.ajax({
    type: "POST",
    dataType: "script",
    url: url,
    data: {
      product_id: productId,
      substitute_name: subName,
      substitute_author: subAuthor
    },
    complete: function(data, textStatus, jqXHR){
        if(data.status === 200) {
            return;/*alert("Registrado.\nMUCHAS GRACIAS!")*/
        }
        else {
            alert('Error :(\nAvisar a administrador por favor');
        }
    }
  });
}
