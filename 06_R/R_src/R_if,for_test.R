## 연습문제
# 소수(Prime Number)체크
# if문과 for문을 이용하여 매개변수가 소수(prime Number)인지 아
# 닌지 TRUE나 FALSE를 return 하는 함수를 작성하고 호출하시오

prime.num <- function(num){
  result <- TRUE
  if(num <= 1){
    cat('소수가 아닙니다')
    retrun()
  }else if(num == 2){
    retrun(TRUE)
  }else {
    for(i in 2:(num-1)){
      if (num %% 2 == 0){
        result = FALSE 
        break;
      } 
    }
  }
  return(result)
}
prime.num(9)