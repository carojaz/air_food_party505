import flatpickr from "flatpickr";
import "flatpickr/dist/themes/dark";

const flatpickrFction = () => {
 flatpickr(".datepicker", {
    minDate: "today",
    dateFormat: "d-m-Y"
  });
}
export { flatpickrFction };
