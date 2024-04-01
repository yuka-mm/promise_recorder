document.addEventListener('turbo:load', function() {
  if (document.getElementById('payday-new-edit') !== null) {
    // セレクトボックスが変更されたときの動作
    document.getElementById('notification_type').addEventListener('change', function() {
      console.log('Select box changed:', this.value);
      setDisabledStatus();
    });
    // 初期表示時にもフォームの状態を設定する
    setDisabledStatus();
  }
});

function setDisabledStatus() {
  let selectBox = document.getElementById('notification_type');
  let selectedOption = selectBox.options[selectBox.selectedIndex].value;

  let dateField = document.getElementById('date_field');
  let weekField = document.getElementById('week_field');

  console.log('Selected option:', selectedOption);

  // 日付を指定し月に１度通知する場合は日付フォームを表示し、曜日フォームを非表示にする
  if (selectedOption === '日付を指定し月に１度通知する') {
      dateField.style.display = 'block';
      weekField.style.display = 'none';
    }
    // 曜日を指定し週に１度通知する場合
    else if (selectedOption === '曜日を指定し週に１度通知する') {
      dateField.style.display = 'none';
      weekField.style.display = 'block';
  }
}
