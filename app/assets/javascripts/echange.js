var default_modal_body = $("#modal-echange").clone();
function trigger_modal_echange() {
  $("#modal-echange").modal('show');
}

$('select#select-annonce').on('change', function() {
  $.ajax({
    type: "GET",
    url: "/ajax_get_annonce_infos_for_modal",
    data: {
      annonce_id : $('select#select-annonce').val()
    },
    contentType: "application/json; charset=utf-8",
    dataType: "json",
    success: function(data){
      data = data[0];
      window.data = data;
      $('#echange-selected-annonce').html('<b>' + data.titre + '</b>');
      $('span.objet-demande').html('<b>' + data.contre + '</b>');
      $('#modal-annonceid-value').val(data.id);
      if(data.autrepropositions === true){
        $('#proposer-autre-objet').show();
      } else {
        $('#objetdemandeur_titre').val($('span.objet-demande').text());
        $('#objetdemandeur_titre').text($('span.objet-demande').text());
        $('#objet-contre').show();
      }
      $('#details-annonce').show(200);
    }
  })
});


$('#btn-non-autre-objet').on('click', function() {
  $('#proposer-autre-objet').fadeOut(200);
  $('#modal-objetdemandeur-titre').val($('span.objet-demande').text());
  $('#objetdemandeur_titre').text($('span.objet-demande').text());
  $('#objet-contre').fadeIn(300);
});

$('#btn-oui-autre-objet').on('click', function() {
  $('#proposer-autre-objet').fadeOut(200);
  $("#objetdemandeur_titre").prop('disabled', false);
  $('span.objet-demande').html('<b>nouvel objet</b>');
  $('#objet-contre').fadeIn(300);
});

$('#btn-non-autre-objet').on('click', function() {
  $('#proposer-autre-objet').fadeOut(200);
  $('#objetdemandeur_titre').val($('span.objet-demande').text());
  $('#objetdemandeur_titre').text($('span.objet-demande').text());
  $('#objet-contre').fadeIn(300);
});

$('#objetdemandeur_titre').on('keyup', function() {
  $('#nouvel-objet').empty().html('<b>' + $('#objetdemandeur_titre').val() + '</b>');
  $('#modal-objetdemandeur-titre').empty().val($('#objetdemandeur_titre').val());
});

$('#modal-typeechange-main').on('change', function() {
  if($(this).is(":checked")) {
    $('#modal-typeechange-value').val(0);
    $('#modal-typeechange-poste').prop('disabled', true);
    $('modal-submit').attr('disabled', false);
  } else {
    $('#modal-typeechange-poste').prop('disabled', false);
    $('#modal-typeechange-value').val('');
    $('modal-submit').attr('disabled', true);
  }
  check_all_fields_filled();
});

$('#modal-typeechange-poste').on('change', function() {
  if($(this).is(":checked")) {
    $('#modal-typeechange-value').val(1);
    $('#modal-typeechange-main').prop('disabled', true);
  } else {
    $('#modal-typeechange-main').prop('disabled', false);
    $('#modal-typeechange-value').val('');
  }
  check_all_fields_filled();
});

function check_all_fields_filled() {
  // console.log($('#modal-objetdemandeur-titre').val());
  // console.log($('#modal-objetdemandeur-photo1').val());
  // console.log($('#modal-demandeurid-value').val());
  // console.log($('#modal-annonceid-value').val());
  // console.log($('#modal-proprietaireid-value').val());
  // console.log($('#modal-typeechange-value').val());
  if($('#modal-objetdemandeur-titre').val()!=""
    && $('#modal-objetdemandeur-photo1').val()!=""
    && $('#modal-demandeurid-value').val()!=""
    && $('#modal-annonceid-value').val()!=""
    && $('#modal-proprietaireid-value').val()!=""
    && $('#modal-typeechange-value').val()!="") {
      $('div#modal-footer').fadeIn(300);
  }
}


// RESET MODAL ON CLOSE ?
// $('#modal-echange').on('hidden.bs.modal', function (e) {
//   $("#modal-echange").empty().html(default_modal_body);
// })
