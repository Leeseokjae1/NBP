package com.study.nbnb;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/spring")
@PropertySource("classpath:dataSource.properties")
public class SpringRestController {

    @Value("${recaptcha.secretKey}")
    private String secretKey;

    @GetMapping("/recaptcha/login")
    public ResRecaptchaForm login(ReqRecaptchaForm form) {

        ResRecaptchaForm resp = new ResRecaptchaForm();

        //  [S]리캡차 검증
        try {
            RecaptchaConfig.setSecretKey(secretKey);
            Boolean verify = RecaptchaConfig.verify(form.getRecaptcha());

	// 검증 실패 시
            if(!verify){
                resp.setStatus(false);
                resp.setErrMsg("reCAPTCHA 검증 실패");

                return resp;
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        //  [E]리캡차 검증

	//검증 통과하면 로그인 진행 코드 작성

        return resp;
    }
}
