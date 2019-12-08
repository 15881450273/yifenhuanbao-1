
window.onload=function () {
    var oDiv = document.getElementById('tab');
    var aBtn = oDiv.getElementsByTagName('input');
    var oDiv1 = document.getElementById("tab-content");
    var aDiv=oDiv1.getElementsByTagName('form')
    for (var i = 0; i < aBtn.length; i++) {
        aBtn[i].index = i;
        aBtn[i].onclick = function () {
            for (var i = 0; i < aBtn.length; i++) {
                /* aBtn[i].className = '';*/
                aDiv[i].style.display = 'none';

            }
            /*this.className= 'active';*/
            aDiv[this.index].style.display = 'block';

        };
    }
};
