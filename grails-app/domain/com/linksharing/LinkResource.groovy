package com.linksharing

class LinkResource extends Resource {
    String URL

    static constraints = {
        URL(url: true)
    }
}
