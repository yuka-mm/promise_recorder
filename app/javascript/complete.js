document.addEventListener('turbo:load', (event) => {
  document.querySelectorAll('.toggle-completed').forEach((element) => {
    element.addEventListener('click', (event) => {
      event.preventDefault();

      const link = event.currentTarget;
      const url = link.href;
      const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
      const childId = element.dataset.childId;
      const countId = element.dataset.countId;

      fetch(url, {
        method: 'PUT',
        headers: {
          'X-Requested-With': 'XMLHttpRequest',
          'X-CSRF-Token': token,
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        credentials: 'same-origin'
      })
      .then(response => response.json())
      .then(data => {
        // アイコン要素を取得
        const icon = link.querySelector('i');

        // `completed`の状態に応じてアイコンと色を変更
        if (data.completed) {
          icon.className = 'fa-solid fa-star display-2 p-2';
          link.style.color = '#db7133';
        } else {
          icon.className = 'fa-regular fa-star display-2 p-2 circle';
          link.style.color = '#db7133';
        }

        // 残りのカウント部分を取得
        const remainingCountElement = document.querySelector('.remaining-count');
      
        // 残りのカウント部分を更新
        if (data.remaining_count > 0) {
          remainingCountElement.textContent = `あと${data.remaining_count}コだよ‼️`;
        } else {
          remainingCountElement.textContent = '達成おめでとう〜‼️';
        }

        const countImageElement = document.querySelector('#count-image');
        const completeImageElement = document.querySelector('#complete-image');

        if (data.remaining_count > 0) {
            countImageElement.style.display = "block";
            completeImageElement.style.display = "none";
        } else {
            countImageElement.style.display = "none";
            completeImageElement.style.display = "block";
        }
      });
    });
  });
});
