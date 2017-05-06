$(document).ready( function() {

  var calculation_url = '/calculate';

  $('.submit').click( function() {
    // Update the form with the appropriate operation.
    $('#operation').val( event.target.value );

    // Execute the calculation.
    calculate();
  });


  /*
   * Perform the calculation via an AJAX request.
   * Updates the page upon success.
   */
  var calculate = function() {
    $.post( calculation_url, $('#calculator').serialize(), apply_results );
  }


  /*
   * Update the page with the results of calculation.
   */
  var apply_results = function( data ) {
    // Update the result.
    $('#result').text( data.result );

    // Update the history.
    $('#history').html( history_list_html( data.history) );
  }


  /*
   * Build the HTML elements of the history list.
   */
  var history_list_html = function( history ) {
    history.reverse();
    return history.map( history_list_element_html ).join('');
  }


  /*
   * Build the HTML for an individual history list item.
   */
  var history_list_element_html = function( value ) {
    return ''.concat( '<li>', value, '</li>');
  }
});