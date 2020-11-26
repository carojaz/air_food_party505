const showInput = () => {
  const rentalDatas = document.querySelector(".rental-datas");
  const price = rentalDatas.dataset.price;

  const startDate = document.getElementById('rental_start_date');
  startDate.addEventListener("change", (event) => {
    const startDateValue = (startDate.value);
    const endDateValue = document.getElementById('rental_end_date').value;
    duration(startDateValue, endDateValue, rentalDatas, price);
  });

  const endDate = document.getElementById('rental_end_date');
  endDate.addEventListener("change", (event) => {
    const endDateValue = (endDate.value);
    const startDateValue = document.getElementById('rental_start_date').value;
    duration(startDateValue, endDateValue, rentalDatas, price);
  });
}

const duration =(start, end, rental, price) => {
  const endDateEn = new Date( end.replace( /(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3") );
  const startDateEn = new Date( start.replace( /(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3") );
  const durationDays = ((endDateEn - startDateEn)/3600000/24 + 1 );
  rental.innerHTML = "";
  if (isNaN(durationDays)) {
    rental.insertAdjacentHTML("beforeend",
    `<p> Please enter start date and end date </p>`)
  } else {
    rental.insertAdjacentHTML("beforeend",
    `<div class="infos">
    </div>
      <h5>Price per day:</h5>
      <p>${price} €</p>
    <div class="infos">
      <h5>Duration selected:</h5>
      <p> ${durationDays} days</p>
    </div>
    <div class="infos">
    <h5>Total price for your rental:</h5>
    <p id="total">${durationDays * price} €</p>
    </div>`)
  }
}
export { showInput };
