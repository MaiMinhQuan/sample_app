document.addEventListener("turbo:load", function() {
  let account = document.querySelector("#account");
  if (account) { // Kiểm tra account tồn tại
    account.addEventListener("click", function(event) {
      event.preventDefault();
      let menu = document.querySelector("#dropdown-menu");
      if (menu) { // Kiểm tra menu tồn tại
        menu.classList.toggle("active");
      }
    });
  }
});
