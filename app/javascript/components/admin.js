function trigger_modal() {
  $("#trigger-modal").on("click", function() {
      $("#user_annonces_modal").modal('show');
  });
}

export { trigger_modal };
