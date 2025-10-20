// Adds ripple effect on clickable elements and typing class for inputs
 (function(){
  function createRipple(e){
    const target = e.currentTarget;
    const rect = target.getBoundingClientRect();
    const size = Math.max(rect.width, rect.height) * 1.2;
    const ripple = document.createElement('span');
    ripple.className = 'ripple';
    ripple.style.width = ripple.style.height = size + 'px';
    ripple.style.left = (e.clientX - rect.left - size/2) + 'px';
    ripple.style.top = (e.clientY - rect.top - size/2) + 'px';
    target.appendChild(ripple);
    ripple.addEventListener('animationend', ()=> ripple.remove());
  }

  function bindButtons(){
    const buttons = Array.from(document.querySelectorAll('button, .nav-bar a, .info-btn, .copy-btn'));
    buttons.forEach(btn=>{
      btn.addEventListener('click', createRipple);
    });
  }

  function bindInputs(){
    const inputs = Array.from(document.querySelectorAll('input[type=text], textarea, .data-url'));
    inputs.forEach(inp=>{
      let t;
      inp.addEventListener('input', ()=>{
        inp.classList.add('typing');
        clearTimeout(t);
        t = setTimeout(()=> inp.classList.remove('typing'), 700);
      });
      inp.addEventListener('focus', ()=> inp.classList.add('typing'));
      inp.addEventListener('blur', ()=> inp.classList.remove('typing'));
    });
  }

  if(document.readyState === 'loading') document.addEventListener('DOMContentLoaded', ()=>{ bindButtons(); bindInputs(); });
  else { bindButtons(); bindInputs(); }
})();
