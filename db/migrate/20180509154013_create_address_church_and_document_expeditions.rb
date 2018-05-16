class CreateAddressChurchAndDocumentExpeditions < ActiveRecord::Migration[5.1]
  def change
    create_table :address_church_and_document_expeditions do |t|
      t.string :nombreIglesiaAnterior
      t.boolean :iglesia, default: false
      t.boolean :expedicion,default: false
      t.boolean :origen, default: false
      
      
      t.references :user, foreign_key: true
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
