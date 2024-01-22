// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"


// モーダルのjs
document.addEventListener("DOMContentLoaded", function() {
    var modal = new bootstrap.Modal(document.getElementById("exampleModalToggle"));
    var modalTogglePass = new bootstrap.Modal(document.getElementById("exampleModalTogglePass"));
  
    document.querySelectorAll('.child-modal-trigger').forEach(function(button) {
      button.addEventListener("click", function(event) {
        var childId = button.dataset.childId;
        var childName = button.dataset.childName;
        console.log(childId);
  
        var modalTitle = modal._element.querySelector(".modal-title");
        var childIdInput = modal._element.querySelector("#child_id_input");
  
        if (modalTitle && childIdInput) {
          modalTitle.textContent = childName;
          childIdInput.value = childId;
          modal.show();
        }
      });
    });
  
    document.querySelector('#openModal2Button').addEventListener("click", function() {
      var childId = document.querySelector("#child_id_input").value;
      console.log(childId);
  
      var childIdInput = modalTogglePass._element.querySelector("#child_id_input");
      if (childIdInput) {
        childIdInput.value = childId;
        modalTogglePass.show();
      }
    });
  });
  