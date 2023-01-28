export interface IObjectKeys {
  [key: string]: string | number;
}

export interface LoginRequest {
  email: string;
  password: string;
}

export interface LoginResponse {
  access: string;
  refresh: string;
}
