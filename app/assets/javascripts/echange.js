function trigger_modal_echange() {
  $("#modal-echange").modal('show');
}

$('select#select-annonce').on('change', function() {
  $.ajax({
    type: "GET",
    url: "/ajax_modal_get_infos_annonce",
    data: {
      annonce_id : $('select#select-annonce').val()
    },
    contentType: "application/json; charset=utf-8",
    dataType: "json",
    success: function(data){
      data = data[0];
      console.log(data);
      $('#echange-selected-annonce').html('<b>' + data.titre + '</b> contre <b>' + data.contre + '</b>');
      $('span.objet-demande').html('<b>' + data.contre + '</b>');
      if(data.autrepropositions === true){
        $('#proposer-autre-objet').show();
      }
      $('#details-annonce').show(200);
    }
  })
});

$('#btn-non-autre-objet').on('click', function() {
  $('#proposer-autre-objet').fadeOut(200);
  $('#objetdemandeur_titre').val($('span.objet-demande').text());
  $('#objetdemandeur_titre').text($('span.objet-demande').text());
  $('#objet-contre').fadeIn(300);
});
