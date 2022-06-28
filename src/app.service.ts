import { Injectable } from '@nestjs/common';
import { transformEmailData } from './teamplates/orderTeamplate';
import { MailerService } from '@nestjs-modules/mailer';

@Injectable()
export class AppService {
  constructor(private readonly mailerService: MailerService) {}

  getHello(): string {
    return 'Hello World!';
  }

  public async sendOrder(formDataOrderDto: any): Promise<void> {
    const emailData = transformEmailData(formDataOrderDto)
    this.mailerService
      .sendMail(emailData)
      .then(() => {})
      .catch((error) => console.log(error)
      );
  }
  }
