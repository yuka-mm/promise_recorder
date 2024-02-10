document.addEventListener('turbo:load', (event) => {
  document.querySelectorAll('.toggle-completed').forEach((element) => {
    element.addEventListener('click', (event) => {
      event.preventDefault();

      const link = event.currentTarget;
      const url = link.href;
      const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

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
          icon.className = 'fa-solid fa-star h1';
          link.style.color = '#db7133';
        } else {
          icon.className = 'fa-regular fa-star h1';
          link.style.color = '#db7133';
        }
      });
    });
  });
});
