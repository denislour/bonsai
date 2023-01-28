import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { ACCESS_TOKEN, REFRESH_TOKEN } from '../constants/keys.constant';
import { LoginRequest, LoginResponse } from '../models/auth.model';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  constructor(private httpClient: HttpClient) {}

  public login(input: LoginRequest): Observable<LoginResponse> {
    console.log(123);
    return this.httpClient.post<LoginResponse>(
      `${environment.baseUrl}/api/token/`,
      {
        email: input.email,
        password: input.password,
      }
    );
  }

  public isAuthenticated(): boolean {
    return localStorage.getItem(ACCESS_TOKEN) != null;
  }

  public logout() {
    localStorage.removeItem(ACCESS_TOKEN);
    localStorage.removeItem(REFRESH_TOKEN);
  }
}
