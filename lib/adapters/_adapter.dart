abstract class EntityModelAdapter<Entity, Model> {
  /// 모델을 엔티티로 변환
  Entity toEntity(Model model);
  
  /// 엔티티를 모델로 변환
  Model toModel(Entity entity);
}