DROP PROCEDURE IF EXISTS egd.PS_MsgMailIn_UpdateRattachement_Val_v2;
CREATE PROCEDURE egd.`PS_MsgMailIn_UpdateRattachement_Val_v2`(OUT out_ReponseXml               TEXT
                                                         , IN in_UserId                    INT
                                                         , IN in_fkClient                  INT
                                                         , IN in_fkDossier                 INT
                                                         , IN in_Id                        INT
                                                         , IN in_fkObligation              INT
                                                         , IN in_fkPers                    INT
                                                         , IN in_fkBien                    INT
                                                         , IN in_Commentaires              TEXT
                                                          )
BEGIN
  DECLARE var_TimeDeb, var_TimeCheck                DATETIME DEFAULT now();
  DECLARE var_TimeTrace                             TEXT DEFAULT "CHRONOS";
  DECLARE var_RetourXml                             TEXT;
  DECLARE var_DataTrace                             TEXT DEFAULT '';

  SET var_DataTrace = CONCAT('ENTREE(S): in_Id='            , IFNULL(in_Id, 'Null')
                                   , ' ; in_fkObligation='  , IFNULL(in_fkObligation, 'Null')
                                   , ' ; in_fkPers='        , IFNULL(in_fkPers, 'Null')
                                   , ' ; in_fkBien='        , IFNULL(in_fkBien , 'Null')
                                   , ' ; in_Commentaires='        , IFNULL(in_Commentaires , 'Null')
                            );

  CALL Journaliser_v4(in_UserId, in_fkClient, in_fkDossier, 'act_MsgMailIn_UpdateRat_MP'   -- in_UserId, in_fkClient, in_fkDossier, in_xActionName
                    , Null, 'PS_MsgMailIn_UpdateRattachement_Val_v2', 'DEBUT'       -- in_FrmName, in_PSName, xEtape
                    , Null, 1                         -- in_Duree_ms, in_Niv
                    , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0           -- Ob, Pe, Bi, Rib, Pat, Vir, Op, Ec, Dc, Bp, Evt
                    , IFNULL(var_DataTrace,'')
                    );
                    
  UPDATE msg_mail
    SET fkObligation = in_fkObligation
      , fkPersonne = in_fkPers
      , fkBien = in_fkBien
      , Commentaires = in_Commentaires
    WHERE fkClient = in_fkClient
    AND fkDossier = in_fkDossier
    AND Id = in_Id;
    
  SET out_ReponseXml := '<xml>';
  SET out_ReponseXml := CONCAT(out_ReponseXml, FN_APPEND_PARAM('app_code_retour', '001'));
  SET out_ReponseXml := CONCAT(out_ReponseXml, '</xml>');

  CALL Journaliser_v4(in_UserId, in_fkClient, in_fkDossier, 'act_MsgMailIn_UpdateRat_MP'   -- in_UserId, in_fkClient, in_fkDossier, in_xActionName
                    , Null, 'PS_MsgMailIn_UpdateRattachement_Val_v2', 'FIN'       -- in_FrmName, in_PSName, xEtape
                    , Null, 0                         -- in_Duree_ms, in_Niv
                    , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0           -- Ob, Pe, Bi, Rib, Pat, Vir, Op, Ec, Dc, Bp, Evt
                    , CONCAT( IFNULL(var_DataTrace,'')
                            , ' | SORTIE(S) : out_ReponseXml=', IFNULL(out_ReponseXml, 'Null')
                            )
                    );
END;
