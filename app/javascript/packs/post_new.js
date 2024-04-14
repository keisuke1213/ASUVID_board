const dateDecidedSelect = document.getElementById('dateDecidedSelect');
const datePicker = document.getElementById('datePicker');
const textInput = document.getElementById('textInput');

dateDecidedSelect.addEventListener('change', () => {
  if(dateDecidedSelect.value === 'true') {
    datePicker.style.display = 'block';
    textInput.style.display = 'none';
  } else {
    datePicker.style.display = 'none';
    textInput.style.display = 'block';
  }
});