<?php

class ModelToolRegex extends Model
{
    public function regx($text,$string,$string2 = null)
    {
        if ($string2){
            $text = preg_replace('/('. $string .')=\w+.*?&/i','',$text);
            $text = preg_replace('/('. $string2 .')=\w+.*?&/i','',$text);
        }else {
            $text = preg_replace('/('. $string .')=\w+.*?&/i','',$text);
        }
        return $text;
    }

}