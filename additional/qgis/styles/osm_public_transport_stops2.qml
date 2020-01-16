<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.4.3-Madeira" maxScale="-4.65661e-10" simplifyDrawingHints="0" labelsEnabled="0" readOnly="0" minScale="-4.65661e-10" simplifyAlgorithm="0" styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" simplifyLocal="1" simplifyMaxScale="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 enableorderby="0" symbollevels="0" type="RuleRenderer" forceraster="0">
    <rules key="{1a3024e6-1f09-46ca-9624-692f413086d3}">
      <rule scalemindenom="1" label="bus" filter=" &quot;type&quot; IN ('bus', 'bus_stop')" symbol="0" key="{73167de8-969e-4eb7-b136-02bcb6d07ad1}" scalemaxdenom="2500"/>
      <rule scalemindenom="1" label="tram" filter="&quot;type&quot; = 'tram'" symbol="1" key="{8d808813-85f6-44a9-81b0-a7f0e39d989e}" scalemaxdenom="2500"/>
      <rule scalemindenom="1" label="train" filter="&quot;type&quot; = 'train'" symbol="2" key="{446bc4d9-3ef9-4c93-99f8-a887213524b0}" scalemaxdenom="2500"/>
    </rules>
    <symbols>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="0" type="marker">
        <layer locked="0" pass="0" class="SvgMarker" enabled="1">
          <prop v="0" k="angle"/>
          <prop v="102,131,220,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="Styles/blue_bus.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="6" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="1" type="marker">
        <layer locked="0" pass="0" class="SvgMarker" enabled="1">
          <prop v="0" k="angle"/>
          <prop v="7,209,254,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="Styles/black_train.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="6" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="2" type="marker">
        <layer locked="0" pass="0" class="SvgMarker" enabled="1">
          <prop v="0" k="angle"/>
          <prop v="142,7,138,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="Styles/black_train.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="6" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <customproperties>
    <property value="&quot;line_name&quot;" key="dualview/previewExpressions"/>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory penAlpha="255" sizeScale="3x:0,0,0,0,0,0" sizeType="MM" enabled="0" scaleDependency="Area" rotationOffset="270" penWidth="0" diagramOrientation="Up" height="15" minScaleDenominator="-4.65661e-10" lineSizeScale="3x:0,0,0,0,0,0" penColor="#000000" barWidth="5" minimumSize="0" labelPlacementMethod="XHeight" backgroundColor="#ffffff" lineSizeType="MM" width="15" scaleBasedVisibility="0" opacity="1" maxScaleDenominator="1e+08" backgroundAlpha="255">
      <fontProperties style="" description="MS Shell Dlg 2,9.6,-1,5,50,0,0,0,0,0"/>
      <attribute field="" color="#000000" label=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings dist="0" showAll="1" zIndex="0" obstacle="0" placement="0" linePlacementFlags="18" priority="0">
    <properties>
      <Option type="Map">
        <Option name="name" value="" type="QString"/>
        <Option name="properties"/>
        <Option name="type" value="collection" type="QString"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="id">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="import_geom">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="osm_id">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="atcocode">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="name">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="landmark">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="type">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="naptan">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="way_point">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="cluster_id">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="id" name="" index="0"/>
    <alias field="import_geom" name="" index="1"/>
    <alias field="osm_id" name="" index="2"/>
    <alias field="atcocode" name="" index="3"/>
    <alias field="name" name="" index="4"/>
    <alias field="landmark" name="" index="5"/>
    <alias field="type" name="" index="6"/>
    <alias field="naptan" name="" index="7"/>
    <alias field="way_point" name="" index="8"/>
    <alias field="cluster_id" name="" index="9"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="id" expression="" applyOnUpdate="0"/>
    <default field="import_geom" expression="" applyOnUpdate="0"/>
    <default field="osm_id" expression="" applyOnUpdate="0"/>
    <default field="atcocode" expression="" applyOnUpdate="0"/>
    <default field="name" expression="" applyOnUpdate="0"/>
    <default field="landmark" expression="" applyOnUpdate="0"/>
    <default field="type" expression="" applyOnUpdate="0"/>
    <default field="naptan" expression="" applyOnUpdate="0"/>
    <default field="way_point" expression="" applyOnUpdate="0"/>
    <default field="cluster_id" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint field="id" constraints="3" exp_strength="0" notnull_strength="1" unique_strength="1"/>
    <constraint field="import_geom" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="osm_id" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="atcocode" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="name" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="landmark" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="type" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="naptan" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="way_point" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="cluster_id" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="id" exp="" desc=""/>
    <constraint field="import_geom" exp="" desc=""/>
    <constraint field="osm_id" exp="" desc=""/>
    <constraint field="atcocode" exp="" desc=""/>
    <constraint field="name" exp="" desc=""/>
    <constraint field="landmark" exp="" desc=""/>
    <constraint field="type" exp="" desc=""/>
    <constraint field="naptan" exp="" desc=""/>
    <constraint field="way_point" exp="" desc=""/>
    <constraint field="cluster_id" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortExpression="" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column hidden="0" name="id" width="-1" type="field"/>
      <column hidden="0" name="import_geom" width="-1" type="field"/>
      <column hidden="0" name="osm_id" width="-1" type="field"/>
      <column hidden="0" name="atcocode" width="-1" type="field"/>
      <column hidden="0" name="name" width="-1" type="field"/>
      <column hidden="0" name="landmark" width="-1" type="field"/>
      <column hidden="0" name="type" width="-1" type="field"/>
      <column hidden="0" name="naptan" width="-1" type="field"/>
      <column hidden="0" name="way_point" width="-1" type="field"/>
      <column hidden="0" name="cluster_id" width="-1" type="field"/>
      <column hidden="1" width="-1" type="actions"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1">C:/PROGRA~1/QGIS3~1.4/bin</editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath>C:/PROGRA~1/QGIS3~1.4/bin</editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field editable="1" name="atcocode"/>
    <field editable="1" name="cluster_id"/>
    <field editable="1" name="id"/>
    <field editable="1" name="import_geom"/>
    <field editable="1" name="landmark"/>
    <field editable="1" name="name"/>
    <field editable="1" name="naptan"/>
    <field editable="1" name="osm_id"/>
    <field editable="1" name="type"/>
    <field editable="1" name="way_point"/>
  </editable>
  <labelOnTop>
    <field name="atcocode" labelOnTop="0"/>
    <field name="cluster_id" labelOnTop="0"/>
    <field name="id" labelOnTop="0"/>
    <field name="import_geom" labelOnTop="0"/>
    <field name="landmark" labelOnTop="0"/>
    <field name="name" labelOnTop="0"/>
    <field name="naptan" labelOnTop="0"/>
    <field name="osm_id" labelOnTop="0"/>
    <field name="type" labelOnTop="0"/>
    <field name="way_point" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>id</previewExpression>
  <mapTip>line_name</mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
