// Entry point for the build script in your package.json
import { Dropdown } from 'bootstrap';
import "@hotwired/turbo-rails";
import "./controllers";
import "./modal.js";
import "./payday.js";
import "./reward.js";

document.addEventListener('turbolinks:load', () => {
  // Bootstrap initialization code

  // もしドロップダウンなどのコンポーネントを使用する場合は、次のように初期化することがあります。
  // 例: ドロップダウンを有効にする
  var dropdownElementList = [].slice.call(document.querySelectorAll('.dropdown-toggle'));
  var dropdownList = dropdownElementList.map(function (dropdownToggleEl) {
    return new Dropdown(dropdownToggleEl);
  });
});
