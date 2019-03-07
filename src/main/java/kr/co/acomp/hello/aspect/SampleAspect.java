package kr.co.acomp.hello.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class SampleAspect {
    //AspectJ 포인트컷 표현식은 포인트 지시자를 이용하여 작성함
	//execution:포인트컷 지시자중에서 가장 대표적으로 사용
	@Before("execution(* kr.co.acomp.hello..*.*(..))")
	public void before(JoinPoint joinPoint) {
		String targetMethodName=
				joinPoint.getSignature().getName();
		
		System.out.println(targetMethodName+" is inboked...");
	}
}
