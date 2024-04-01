document.addEventListener('turbo:load', function() {
  if (document.getElementById('promises-new-edit') !== null) {  
    // セレクトボックスが変更されたときの動作
    document.getElementById('select_type').addEventListener('change', function() {
      console.log('Select box changed:', this.value);
      setDisabledStatus();
    });
    // 初期状態の設定
    setDisabledStatus();
  }
});

function setDisabledStatus() {
  let selectBox = document.getElementById('select_type');
  let selectedOption = selectBox.options[selectBox.selectedIndex].value;

  let dateField2 = document.getElementById('date_field2');
  let weekField2 = document.getElementById('week_field2');
  let dateSelect = document.getElementById('date_select');

  // 日付を指定し月に１度通知する場合は日付フォームを表示し、曜日フォームを非表示にする
  if (selectedOption === '日付を指定して登録する') {
    dateField2.style.display = 'block';
    weekField2.style.display = 'none';
    dateSelect.querySelectorAll('select').forEach(select => select.disabled = false);
  }
  // 曜日を指定し週に１度通知する場合
  else if (selectedOption === '曜日を指定して登録する') {
    dateField2.style.display = 'none';
    weekField2.style.display = 'block';
    dateSelect.querySelectorAll('select').forEach(select => select.disabled = true);
  }
}
