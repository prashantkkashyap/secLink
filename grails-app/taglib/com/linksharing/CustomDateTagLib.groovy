package com.linksharing

class CustomDateTagLib {
    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "customdate"
    def dateFormat = { attr ->
        Date d = attr.date
        String format = attr.format
        out << d.format(format)
    }
    def repeate = {attr ->
        int min = Integer.parseInt(attr.min);
        int max =  Integer.parseInt(attr.max);


    }

}
