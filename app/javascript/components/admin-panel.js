let checkifadminpanel = document.getElementById("admin-panel-bug-fix");

function adminpanel() {
  if (checkifadminpanel) {
    $(document).ready(function(){
      document.getElementById("admin-panel-bug-fix").click()
    });
  }
}

export { adminpanel };
