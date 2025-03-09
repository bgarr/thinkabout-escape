import Rails from "../../rails-ujs.esm";

const setPerPage = function (event) {
  const params = new URLSearchParams(window.location.search);
  params.set("per_page", this.value);
  window.location.search = params;
};

Rails.delegate(document, ".pagination-per-page", "change", setPerPage);
