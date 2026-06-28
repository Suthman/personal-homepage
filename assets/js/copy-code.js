document.addEventListener("DOMContentLoaded", function () {
  const codeBlocks = document.querySelectorAll("div.highlight");

  codeBlocks.forEach(function (container) {
    if (container.querySelector(".code-block-footer")) {
      return;
    }
    
    const preElement = container.querySelector("pre");
    if (!preElement) {
      return;
    }

    // 1. Create the footer bar container
    const footerBar = document.createElement("div");
    footerBar.className = "code-block-footer";

    // COLOR MATCH FIX: Get the exact background color of the code block dynamically
    const computedStyles = window.getComputedStyle(preElement);
    const exactBgColor = computedStyles.backgroundColor;
    footerBar.style.backgroundColor = exactBgColor;

    // 2. Create the text label
    const label = document.createElement("span");
    label.className = "code-block-label";
    label.innerText = "Use code with caution.";

    // 3. Create the copy button
    const button = document.createElement("button");
    button.className = "btn-copy-footer";
    button.innerHTML = '<i class="far fa-copy"></i>';
    button.setAttribute("aria-label", "Copy code snippet");

    // Assemble the footer bar
    footerBar.appendChild(label);
    footerBar.appendChild(button);

    // Append the footer bar directly at the end of the inner highlight container
    container.appendChild(footerBar);

    // Click logic to copy the code
    button.addEventListener("click", function () {
      const codeElement = container.querySelector("code");
      const textToCopy = codeElement ? codeElement.innerText : container.innerText;

      navigator.clipboard.writeText(textToCopy).then(function () {
        button.innerHTML = '<i class="fas fa-check" style="color: #2ecc71;"></i>';
        setTimeout(function () {
          button.innerHTML = '<i class="far fa-copy"></i>';
        }, 2000);
      }).catch(function (error) {
        console.error("Copy failed: ", error);
      });
    });
  });
});
