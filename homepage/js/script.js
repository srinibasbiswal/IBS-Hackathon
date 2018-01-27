$(document).ready(function() {

    var firstSeatLabel = 1;
    var sc = $('#seat-map').seatCharts({
        map: [
            'aaa_a',
            'aaa_a',
            'aaa_a',
            'aaa_a',
            'cca_c',
            'cca_c',
            'aaa_a',
            'aaa_a',
            'aaa_a',
            'aaa_a'
        ],
        naming: {
            top: false,
            getLabel: function(character, row, column) {
                return firstSeatLabel++;
            }
        },
        click: function() {
            if (this.status() == 'available') {
                //do some stuff, i.e. add to the cart
                return 'selected';
            } else if (this.status() == 'selected') {
                //seat has been vacated
                return 'available';
            } else if (this.status() == 'unavailable') {
                //seat has been already booked
                return 'unavailable';
            } else {
                return this.style();
            }
        }
    });

    //Make all available 'c' seats unavailable
    sc.find('c.available').status('unavailable');

});


function showDiv(formid) {
    div = document.getElementById(formid);
    div.style.display = "block";

}