import flatpickr from "flatpickr";
import "flatpickr/dist/themes/dark";

document.addEventListener('turbolinks:load', () => {
  flatpickr(".datepicker", {
    minDate: "today",
    dateFormat: "d-m-Y"
  })
});
