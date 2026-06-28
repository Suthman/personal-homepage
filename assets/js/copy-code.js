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

    // CONTENT CHECK: Abort if the code block has no actual code content
    const codeElement = container.querySelector("code");
    if (!codeElement || !codeElement.innerText.trim()) {
      return;
    }

    // Create the footer bar container
    const footerBar = document.createElement("div");
    footerBar.className = "code-block-footer";

    // Read all relevant computed styles from the original elements
    const computedStylesPre = window.getComputedStyle(preElement);
    const computedStylesContainer = window.getComputedStyle(container);
    
    // Match background color & box-shadow
    footerBar.style.backgroundColor = computedStylesPre.backgroundColor;
    footerBar.style.boxShadow = computedStylesPre.boxShadow;
    
    // Create the text label and dynamically match all typography settings
    const label = document.createElement("span");
    label.className = "code-block-label";
    label.innerText = "Use code with caution.";
    label.style.fontFamily = computedStylesContainer.fontFamily;
    label.style.fontWeight = computedStylesContainer.fontWeight || "normal";
    label.style.fontStyle = computedStylesContainer.fontStyle || "normal";

    // Calculate label font size based on code font size (85%)
    const codeFontSizeStr = computedStylesPre.fontSize;
    const codeFontSizeVal = parseFloat(codeFontSizeStr);
    if (!isNaN(codeFontSizeVal)) {
      label.style.fontSize = (codeFontSizeVal * 0.85) + "px";
    }

    // Match border-radius dynamically from the original container
    const origRadius = computedStylesPre.borderBottomLeftRadius || "4px";
    footerBar.style.borderBottomLeftRadius = origRadius;
    footerBar.style.borderBottomRightRadius = origRadius;

    // Match layout: Transfer margin-bottom from pre element to the footer
    const origMarginBottom = computedStylesPre.marginBottom;
    footerBar.style.marginBottom = origMarginBottom;

    // Match all paddings (top, bottom, left, right) to match the code box proportions
    footerBar.style.paddingTop = computedStylesPre.paddingTop;
    footerBar.style.paddingBottom = computedStylesPre.paddingBottom;
    footerBar.style.paddingLeft = computedStylesPre.paddingLeft;
    footerBar.style.paddingRight = computedStylesPre.paddingRight;

    // Match borders: Copy side and bottom borders to the footer
    footerBar.style.borderLeft = computedStylesPre.borderLeft;
    footerBar.style.borderRight = computedStylesPre.borderRight;
    footerBar.style.borderBottom = computedStylesPre.borderBottom;

    // Inherit and soften the text color for the internal top-border separator
    const origTextColor = computedStylesPre.color || "rgba(255, 255, 255, 0.2)";
    footerBar.style.color = origTextColor.replace("rgb", "rgba").replace(")", ", 0.15)");

    // SEPARATION OF CONCERNS: Only add a state class. No hardcoded design changes here!
    preElement.classList.add("has-footer");

    // Create the copy button
    const button = document.createElement("button");
    button.className = "btn-copy-footer";
    button.innerHTML = '<i class="far fa-copy"></i>';
    button.setAttribute("aria-label", "Copy code snippet");
    
    // Disable the default browser focus ring to prevent the white border on click
    button.style.outline = "none";

    // Inherit the theme's border-radius for the button hover background
    button.style.borderRadius = origRadius;

    // Assemble the footer bar
    footerBar.appendChild(label);
    footerBar.appendChild(button);
    container.appendChild(footerBar);

    // Click logic to copy the code
    button.addEventListener("click", function () {
      const textToCopy = codeElement.innerText;

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
