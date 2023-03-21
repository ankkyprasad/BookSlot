// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";
import "flowbite/dist/flowbite.turbo.js";

Turbo.setConfirmMethod((message, element) => {
  const dialog = document.getElementById("turbo-confirm");
  //   dialog.querySelector('p').textContent = message
  dialog.showModal();

  return new Promise((resolve, reject) => {
    dialog.addEventListener(
      "close",
      () => {
        resolve(dialog.returnValue == "confirm");
      },
      { once: true }
    );
  });
});
