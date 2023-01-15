# Riverpod Layered Architecture
<img width="400" src="https://user-images.githubusercontent.com/39579511/212543013-ff74778e-8578-43ab-ab80-45ccc19763b5.png">

## 4-layer architecture
- RiverpodのDI（依存性注入）機能を活用して各レイヤーを疎結合に扱います
- 各レイヤーの説明
  - Presentation層
    - ユーザーとの I/F を担う層。Application 層と Domain 層に依存する。Infrastructure 層に依存してはいけない。
  - Application層
    - アプリケーションのロジックや状態を定義する層。Domain 層に依存する。Presentation 層と Infrastructure 層に依存してはいけない。
  - Domain層
    - ドメインロジックやドメインオブジェクト（エンティティ）を定義する層。どの層にも依存してはいけない。
  - Infrastructure層
    - データの永続化や外部サービス連携を担う層。Domain 層に依存する。Presentation 層と Application 層に依存してはいけない。

## 題材：超簡易掲示板
<img width="300" alt="スクリーンショット 2022-06-29 23 06 45" src="https://user-images.githubusercontent.com/39579511/176461489-4b7554ed-362c-424c-b614-846a7a5895e4.png"> <img width="300" alt="スクリーンショット 2022-06-29 23 07 13" src="https://user-images.githubusercontent.com/39579511/176461520-d7d8a8ce-6bc6-490f-96b3-84156941fd9b.png">

## Flutter大学 共同勉強会
- [発表動画](https://vimeo.com/734039186/48cb6c3d03)
- [発表スライド](https://docs.google.com/presentation/d/1u_nfbLkCHpVsX3TOpPchE-BqwYbySVk14QcRqjNZ45I/edit#slide=id.g1276827f2e_0_5)

## 参考

- [Flutter App Architecture: The Repository Pattern](https://codewithandrea.com/articles/flutter-repository-pattern/)
- [Flutter大学_共同開発アプリ_BURALLY](https://github.com/team-musashi/stamp-rally)
