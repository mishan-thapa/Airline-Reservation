/**
 * 
 */
 function SelectForBooking()
 {
	var rIndex,table=document.getElementById("booktable");
	for(var i=1;i<table.rows.length;i++){
		table.rows[1].onclick=function()
		{
			rIndex = this.rowIndex;
			console.log(rIndex);
		};
	}
}

SelectForBooking();