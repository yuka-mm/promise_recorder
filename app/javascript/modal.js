import { Modal } from 'bootstrap';

document.addEventListener('turbo:load', function() {    //モーダル１
  document.querySelectorAll('.child-modal-trigger').forEach(function(element) {
    element.addEventListener('click', function() {
      var childId = this.dataset.childId;
      var childName = this.dataset.childName;
      var modalElement = document.getElementById('exampleModalToggle_' + childId);
      console.log('childId:', childId);  // 追加
      console.log('modalElement:', modalElement);  // 追加
      modalElement.querySelector('.modal-title').textContent = childName;
      modalElement.querySelector('#child_id_input_' + childId).value = childId;
      console.log('childId:', childId);  // 追加
      var myModal = new Modal(modalElement);
      myModal.show();
    });
  });

  document.querySelectorAll('[id^="openModal2Button_"]').forEach(function(button) { //モーダル２
    button.addEventListener('click', function() {
        console.log('Button clicked!');
        var childId = this.dataset.childId;
        var modalElement = document.getElementById('exampleModalTogglePass_' + childId);
        console.log('selector:', '#child_id_input_pass_' + childId);  // 追加
        console.log('selected element:', modalElement.querySelector('#child_id_input_pass_' + childId));  // 追加

      modalElement.querySelector('#child_id_input_pass_' + childId).value = childId;
      var myModal = new Modal(modalElement);
      myModal.show();
    });
  });
});
