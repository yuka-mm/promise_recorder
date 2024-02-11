document.addEventListener('turbo:load', function() {
  if (document.getElementById('promises-new-edit') !== null) {
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
  let radio6 = document.getElementById('flexRadioDefault6');
  let radio7 = document.getElementById('flexRadioDefault7');

  console.log("radio6 checked: ", radio6.checked);
  console.log("radio7 checked: ", radio7.checked);
  
  let dateSelect = document.getElementById('date_select');
  let checkFlag = document.getElementById('check_flag');
  let weekDay = document.getElementById('weekday');

  if (radio6.checked) {
    dateSelect.querySelectorAll('select').forEach(select => select.disabled = false);
    checkFlag.querySelectorAll('input').forEach(input => input.disabled = false);
    weekDay.querySelectorAll('select').forEach(select => select.disabled = true);
  } else {
    dateSelect.querySelectorAll('select').forEach(select => select.disabled = true);
    checkFlag.querySelectorAll('input').forEach(input => { input.disabled = true; input.checked = false; });
    weekDay.querySelectorAll('select').forEach(select => select.disabled = false);
  }
}
