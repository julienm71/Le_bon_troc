import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#home-search-text', {
    strings: ["Lebontroc, la première plateforme d'échange sécurisé et simplifié!"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
