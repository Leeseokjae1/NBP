package com.study.nbnb.oauth2;

import java.util.Map;

public class OAuthAttributes {
	private Map<String, Object> attributes;
	private String nameAttributeKey;
	private String name;
	private String email;
	private String picture;

	
	public OAuthAttributes() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Map<String, Object> getAttributes() {
		return attributes;
	}

	public void setAttributes(Map<String, Object> attributes) {
		this.attributes = attributes;
	}

	public String getNameAttributeKey() {
		return nameAttributeKey;
	}

	public void setNameAttributeKey(String nameAttributeKey) {
		this.nameAttributeKey = nameAttributeKey;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public OAuthAttributes(Map<String, Object> attributes, String nameAttributeKey,
			               String name, String email, String picture) 
	{
		this.attributes = attributes;
		this.nameAttributeKey = nameAttributeKey;
		this.name = name;
		this.email = email;
		this.picture = picture;
	}

	public static OAuthAttributes of(String registrationId, String userNameAttributeName,
			                         Map<String, Object> attributes) 
	{
//		System.out.println(registrationId);
//		System.out.println(userNameAttributeName);
		if (registrationId.equals("google")) {
			return ofGoogle(userNameAttributeName, attributes);
		} else if  (registrationId.equals("facebook")) {
			return ofFacebook(userNameAttributeName, attributes);
		} else if  (registrationId.equals("kakao")) {
			return ofKakao(userNameAttributeName, attributes);
		} else if  (registrationId.equals("naver")) {
			return ofNaver(userNameAttributeName, attributes);
		}
		return ofGoogle(userNameAttributeName, attributes);
	}

	private static OAuthAttributes ofGoogle(String userNameAttributeName, Map<String, Object> attributes) 
	{
		return OAuthAttributes.builder()
				.name((String) attributes.get("name"))
				.email((String) attributes.get("email"))
				.picture((String) attributes.get("picture"))
				.attributes(attributes)
				.nameAttributeKey(userNameAttributeName)
				.build();
	}
	
	private static OAuthAttributes ofFacebook(String userNameAttributeName, Map<String, Object> attributes) 
	{
//		System.out.println(attributes);
		String sName = (String) attributes.get("name");
		String sEmail = (String) attributes.get("email");
		Map<String, Object> pic1 = (Map<String, Object>) attributes.get("picture");
		Map<String, Object> pic2 = (Map<String, Object>) pic1.get("data");
		String pic3 = (String) pic2.get("url");
		
		return OAuthAttributes.builder()
				.name(sName)
				.email(sEmail)
				.picture(pic3)
				.attributes(attributes)
				.nameAttributeKey(userNameAttributeName)
				.build();
	}

	private static OAuthAttributes ofKakao(String userNameAttributeName, Map<String, Object> attributes) 
	{
//		System.out.println(attributes);
		Map<String, Object> obj1 = (Map<String, Object>) attributes.get("kakao_account");
		Map<String, Object> obj2 = (Map<String, Object>) obj1.get("profile");
		String sName = (String) obj2.get("nickname");
		String sPic = (String) obj2.get("thumbnail_image_url");
		String sEmail = (String) obj1.get("email");
		
		return OAuthAttributes.builder()
				.name(sName)
				.email(sEmail)
				.picture(sPic)
				.attributes(attributes)
				.nameAttributeKey(userNameAttributeName)
				.build();
	}

	private static OAuthAttributes ofNaver(String userNameAttributeName, Map<String, Object> attributes) 
	{
//		System.out.println(attributes);
		Map<String, Object> obj1 = (Map<String, Object>) attributes.get("response");
		String sName = (String) obj1.get("name");
		String sPic = (String) obj1.get("profile_image");
		String sEmail = (String) obj1.get("email");

		return OAuthAttributes.builder()
				.name(sName)
				.email(sEmail)
				.picture(sPic)
				.attributes(attributes)
				.nameAttributeKey(userNameAttributeName)
				.build();
	}
	public static OAuthAttributesBuilder builder() {
        return new OAuthAttributesBuilder();
    }
	
	public static class OAuthAttributesBuilder {

        private Map<String, Object> attributes;
        private String nameAttributeKey;
        private String name;
        private String email;
        private String picture;

        public OAuthAttributesBuilder attributes(Map<String, Object> attributes) {
            this.attributes = attributes;
            return this;
        }

        public OAuthAttributesBuilder nameAttributeKey(String nameAttributeKey) {
            this.nameAttributeKey = nameAttributeKey;
            return this;
        }

        public OAuthAttributesBuilder name(String name) {
            this.name = name;
            return this;
        }

        public OAuthAttributesBuilder email(String email) {
            this.email = email;
            return this;
        }

        public OAuthAttributesBuilder picture(String picture) {
            this.picture = picture;
            return this;
        }

        public OAuthAttributes build() {
            return new OAuthAttributes(attributes, nameAttributeKey, name, email, picture);
        }
    }
	
	
}