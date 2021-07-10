<?php

function visit_url($url,$header = null)
{
	$ch = curl_init($url);
	curl_setopt_array($ch, array(
	    CURLOPT_HTTPHEADER  => $header,
	    CURLOPT_RETURNTRANSFER  =>true,
	    CURLOPT_VERBOSE     => 1
	));
	$out = curl_exec($ch);
	curl_close($ch);
	return $out;
}

function beautify_datetime($date){
    return date_format(date_create($date),"d F Y H:i:s"); 
}

function mysql_datetime_format($date){
    return date_format(date_create($date),"Y-m-d H:i:s"); 
}

function to_carbon($date)
{
	return Carbon\Carbon::parse($date);
}

function get_day_name($id)
{
	$days = array(
		0 => '',
	    1 => 'Minggu',
	    2 => 'Senin',
	    3 => 'Selasa',
	    4 => 'Rabu',
	    5 => 'Kamis',
	    6 => 'Jumat',
	    7 => 'Sabtu'
	);

	return $days[$id];
}

function day_name(){
	return array(
	    1 => 'Minggu',
	    2 => 'Senin',
	    3 => 'Selasa',
	    4 => 'Rabu',
	    5 => 'Kamis',
	    6 => 'Jumat',
	    7 => 'Sabtu'
	);
}