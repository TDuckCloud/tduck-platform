package com.tduck.cloud.form.request;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class CheckWritePwdRequest {

    @NotBlank
    private String formKey;
    @NotBlank
    private String password;
}
