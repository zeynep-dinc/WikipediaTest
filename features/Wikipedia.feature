Feature: Wikipedia Test Denemesi
 
 Scenario: Wikipedia üzerinde Türkçe dili seçilip, Rastgele bir değer getirmeli daha sonra yazılım kelimesini arat,kaynakçayı incele
  Given wikipediaya git
  Then  Türkçeye tıkla
  Then  Rastgele Madde linkine tıkla
  Then  Vikipedi üzerinde ara çubuğuna tıklanır Yazılım kelimesi aratılır
  Then  Yazılım kelimesinin aratıldığı doğrula
  Then  İlk kaynağa tıkla