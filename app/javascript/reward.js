document.addEventListener('turbo:load', function() {
  if (document.getElementById('reward-new-edit') !== null) {
    // 初期状態の設定
    setDisabledStatus();
  
    // ラジオボタンが選択されたときの動作
    document.getElementsByName('flexRadioDefault').forEach(function(radio) {
      radio.addEventListener('change', function() {
        console.log('Radio button changed:', radio);
        setDisabledStatus();
      });
    });
  }
});

function setDisabledStatus() {
  let radio3 = document.getElementById('flexRadioDefault3');
  let radio4 = document.getElementById('flexRadioDefault4');
  let radio5 = document.getElementById('flexRadioDefault5');

  console.log("radio3 checked: ", radio3.checked);
  console.log("radio4 checked: ", radio4.checked);
  console.log("radio5 checked: ", radio5.checked);
  
  let piecesField = document.getElementById('pieces_field');
  let rangeField = document.getElementById('range_field');
  let additionField = document.getElementById('addition_field');

  if (radio3.checked) {
    piecesField.querySelectorAll('input').forEach(input => input.disabled =  false);
    rangeField.querySelectorAll('input').forEach(input => input.disabled = true);
    additionField.querySelectorAll('input').forEach(input => input.disabled = true);
  } else if(radio4.checked) {
    piecesField.querySelectorAll('input').forEach(input => input.disabled = true);
    rangeField.querySelectorAll('input').forEach(input => input.disabled =  false);
    additionField.querySelectorAll('input').forEach(input => input.disabled = true);
  } else {
    piecesField.querySelectorAll('input').forEach(input => input.disabled = true);
    rangeField.querySelectorAll('input').forEach(input => input.disabled = true);
    additionField.querySelectorAll('input').forEach(input => input.disabled =  false);
  }
}
