package main

import (
	"fmt"
	"regexp"
	"strconv"
	"strings"
)

func main() {

	// fmt.Println(IsIdCard("610524199605187211"))
	// fmt.Println(IsIdCard("610524199610187211"))
	var id string
	for {
		fmt.Print("请输入身份证号!\n")
		fmt.Scanln(&id)
		if IsIdCard(id) {
			fmt.Printf("%s -> %s\n\n", id, "✅正确")
		} else {
			fmt.Printf("%s -> %s\n\n", id, "❌错误")
		}
	}
}

// 身份证号正确性检查
func IsIdCard(idCard string) bool {
	idCard = strings.ToUpper(idCard)

	reg := regexp.MustCompile(`^[0-9]{17}[0-9X]$`)
	// reg := regexp.MustCompile(`^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$|^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$`)
	if reg.MatchString(idCard) == false {
		return false
	}
	return checkCode(idCard)
}

// 身份证校验码的计算方法：
//  1、将身份证号码前面的17位数分别乘以不同的加权因子，见： weights
//  2、将这17位数字和加权因子相乘的结果相加，得到的结果再除以11，得到余数 m
//  3、余数m作为位置值，在校验码数组 codes 中找到对应的值，就是身份证号码的第18位校验码
func checkCode(id string) bool {
	weights := []int{7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2}
	codes := []string{"1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2"}

	sum := 0
	for i := 0; i < 17; i++ {
		//id.Code 即 身份证号码
		n, _ := strconv.Atoi(string(id[i]))
		sum += n * weights[i]
	}

	m := sum % 11

	return codes[m] == id[17:]
}
