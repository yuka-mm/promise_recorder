document.addEventListener('turbo:load', function() {
  if (document.getElementById('payday-new-edit') !== null) {
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
  let radio1 = document.getElementById('flexRadioDefault1');
  let radio2 = document.getElementById('flexRadioDefault2');

  console.log("radio1 checked: ", radio1.checked);
  console.log("radio2 checked: ", radio2.checked);
  
  let dateField = document.getElementById('date_field');
  let endMonthField = document.getElementById('end_month_field');
  let weekField = document.getElementById('week_field');

  if (radio1.checked) {
    dateField.querySelectorAll('input').forEach(input => input.disabled = false);
    endMonthField.querySelectorAll('input').forEach(input => input.disabled = false);
    weekField.querySelector('input[type="hidden"]').disabled = false;
    weekField.querySelectorAll('input[type="radio"]').forEach(input => { input.checked = false; });
  } else {
    dateField.querySelectorAll('input').forEach(input => { input.disabled = true; input.value = ''; });
    endMonthField.querySelectorAll('input[type="checkbox"]').forEach(input => { input.disabled = true; input.checked = false; });
    weekField.querySelector('input[type="hidden"]').disabled = true;
    weekField.querySelectorAll('input[type="radio"]').forEach(input => input.disabled = false);
  }
}
