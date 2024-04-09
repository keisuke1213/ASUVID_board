
  const serchlinks = document.querySelectorAll('.search-link');
  serchlinks.forEach(link => {
    link.addEventListener('click',function(event) {
      event.preventDefault();
      const serchText = this.textContent;
      document.getElementById('search-box').value = serchText;
    });
  });
