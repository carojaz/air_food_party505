import Typed from 'typed.js';

  const loadDynamicBannerText = () => {
    const elmt = document.querySelector(".banner");
    if (elmt) {
      new Typed('#banner-typed-text', {
        strings: ["Let's go and rent your favorite food party device :", "Raclette, Pierrade, Crêpe party or a Pop Corn machine !!!"],
        typeSpeed: 60,
        loop: true
      });
    }
  }
export { loadDynamicBannerText };
