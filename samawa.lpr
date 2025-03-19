program samawa;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, SysUtils, // this includes the LCL widgetset
  Forms, dbflaz, sdflaz, runtimetypeinfocontrols, datetimectrls, umain,
  { you can add units after this }
  uCEFApplication, rxnew, indylaz, uecontrols, frameviewer09,
  usplash, uphonebook, uview, upicture, uregistration, utemplate,
  zcomponent, ubugfix, upesan, usettingproxy, uvcfmaker, uqmessage, uInformasi,
  uSapa, uscript, ucetak, uschedule, usendlog, ugoodbye, uabout, ujamu,
umessage, ugetXY;

{$R *.res}

{$IFDEF MSWINDOWS}
  // cef3 needs to set the LARGEADDRESSAWARE flag which allows 32-bit processes to use up to 3GB of RAM.
  {$SetPEFlags $20}
{$ENDIF}

begin
  GlobalCEFApp := TCefApplication.Create;


  GlobalCEFApp.EnableGPU            := True;      // Enable hardware acceleration
  GlobalCEFApp.IgnoreCertificateErrors := True;
  GlobalCEFApp.FrameworkDirPath     := 'support\cef';
  GlobalCEFApp.ResourcesDirPath     := 'support\cef';
  GlobalCEFApp.LocalesDirPath       := 'support\cef\locales';
  GlobalCEFApp.RootCache            := 'support\cache\';
  GlobalCEFApp.PersistSessionCookies := True;

  //GlobalCEFApp.RootCache               := 'support\cache;

  if GlobalCEFApp.StartMainProcess then
    begin
      RequireDerivedFormResource:=True;
      Application.Title:='Samawa7';
      Application.Scaled:=True;
      Application.Initialize;
      Application.CreateForm(TFMain, FMain);
           {
      Application.CreateForm(TfrmMessage, frmMessage);
      Application.CreateForm(TfrmGetXY, frmGetXY);

      Application.CreateForm(TFsplash, Fsplash);
      Application.CreateForm(TFphonebook, Fphonebook);
      Application.CreateForm(TFview, Fview);
      Application.CreateForm(TFpicture, Fpicture);
      Application.CreateForm(TFregistration, Fregistration);
      Application.CreateForm(TFtemplate, Ftemplate);
      Application.CreateForm(TFBugFix, FBugFix);
      Application.CreateForm(TFPesan, FPesan);
      Application.CreateForm(TFsettingproxy, Fsettingproxy);
      Application.CreateForm(TFvcfmaker, Fvcfmaker);
      Application.CreateForm(TFQMessage, FQMessage);
      Application.CreateForm(TFInformasi, FInformasi);
      Application.CreateForm(TFSapa, FSapa);
      Application.CreateForm(TfrmScriptWA, frmScriptWA);
      Application.CreateForm(TfrmCetak, frmCetak);
      Application.CreateForm(TfrmSchedule, frmSchedule);
      Application.CreateForm(TfrmSendLog, frmSendLog);
      Application.CreateForm(TfrmGoodBy, frmGoodBy);
      Application.CreateForm(TFAbout, FAbout);
      Application.CreateForm(TfrmJamu, frmJamu);
      }
      Application.Run;
    end;

  GlobalCEFApp.Free;
  GlobalCEFApp := nil;
end.

