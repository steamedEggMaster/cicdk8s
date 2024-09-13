package com.example.cicdk8s

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

/**
 * @PackageName : com.example.cicdk8s
 * @FileName : cicdContoller
 * @Author : noglass_gongdae
 * @Date : 2024-09-13
 * @Blog : https://blog.naver.com/noglass_gongdae
 * @GitHub :
 */

@RestController
class CicdContoller(

) {

    @GetMapping("/test1")
    fun test1(): String {
        return "Hello, ArgoCD"
    }

}