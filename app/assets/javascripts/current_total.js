
var sum = 0;
$('.description').each(function()
{
    sum += parseFloat($(this).text());
});
console.log(sum);
