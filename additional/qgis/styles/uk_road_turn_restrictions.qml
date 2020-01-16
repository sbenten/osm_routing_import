<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.4.3-Madeira" maxScale="0" simplifyDrawingHints="0" labelsEnabled="0" readOnly="0" minScale="1e+08" simplifyAlgorithm="0" styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" simplifyLocal="1" simplifyMaxScale="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 enableorderby="0" symbollevels="0" type="RuleRenderer" forceraster="0">
    <rules key="{ea65600e-6f49-42a1-8cac-c251e3dac3df}">
      <rule scalemindenom="1" label="no right turn" filter=" &quot;restriction&quot; = 'no_right_turn'" symbol="0" key="{8b19a9c1-3f66-4ca7-9c85-12868505c7c6}" scalemaxdenom="5000"/>
      <rule scalemindenom="1" label="no left turn" filter=" &quot;restriction&quot; = 'no_left_turn'" symbol="1" key="{dd69d8f9-c896-4c5e-b9a6-6ca69d688c22}" scalemaxdenom="5000"/>
      <rule scalemindenom="1" label="no U turn" filter=" &quot;restriction&quot; = 'no_u_turn'" symbol="2" key="{dace0458-baaf-4662-a905-6c22e08e6934}" scalemaxdenom="5000"/>
      <rule scalemindenom="1" label="no straight on" filter=" &quot;restriction&quot; = 'no_straight_on'" symbol="3" key="{949faf1b-5d94-4c3e-a500-98803dc62d72}" scalemaxdenom="5000"/>
      <rule scalemindenom="1" label="only right turn" filter=" &quot;restriction&quot; = 'only_right_turn'" symbol="4" key="{6f91a45c-7c22-48da-b10e-dea4035e4a2d}" scalemaxdenom="5000"/>
      <rule scalemindenom="1" label="only left turn" filter="&quot;restriction&quot; = 'only_left_turn'" symbol="5" key="{39fbdf70-79cb-4218-a464-3ecdd6edc3bc}" scalemaxdenom="5000"/>
      <rule scalemindenom="1" label="only straight on" filter="&quot;restriction&quot; = 'only_straight_on'" symbol="6" key="{20014b81-f302-43dc-b829-5d1d31186150}" scalemaxdenom="5000"/>
    </rules>
    <symbols>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="0" type="marker">
        <layer locked="0" pass="0" class="SvgMarker" enabled="1">
          <prop v="0" k="angle"/>
          <prop v="100,192,234,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="Styles/UK_traffic_sign_612_no_right_turn.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="10" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="angle" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="&quot;sign_azimuth&quot;" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="1" type="marker">
        <layer locked="0" pass="0" class="SvgMarker" enabled="1">
          <prop v="0" k="angle"/>
          <prop v="69,108,251,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="Styles/UK_traffic_sign_613_no_left_turn.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="10" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="angle" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="&quot;sign_azimuth&quot;" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="2" type="marker">
        <layer locked="0" pass="0" class="SvgMarker" enabled="1">
          <prop v="0" k="angle"/>
          <prop v="124,175,191,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="Styles/UK_traffic_sign_614_no_u_turn.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="10" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="angle" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="&quot;sign_azimuth&quot;" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="3" type="marker">
        <layer locked="0" pass="0" class="SvgMarker" enabled="1">
          <prop v="0" k="angle"/>
          <prop v="169,216,226,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="Styles/UK_traffic_sign_616_no_entry.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="10" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="angle" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="&quot;sign_azimuth&quot;" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="4" type="marker">
        <layer locked="0" pass="0" class="SvgMarker" enabled="1">
          <prop v="0" k="angle"/>
          <prop v="169,73,228,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="Styles/UK_traffic_sign_609_right_turn_only.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="10" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="angle" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="&quot;sign_azimuth&quot;" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="5" type="marker">
        <layer locked="0" pass="0" class="SvgMarker" enabled="1">
          <prop v="0" k="angle"/>
          <prop v="167,1,106,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="Styles/UK_traffic_sign_609_left_turn_only.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="10" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="angle" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="&quot;sign_azimuth&quot;" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="6" type="marker">
        <layer locked="0" pass="0" class="SvgMarker" enabled="1">
          <prop v="0" k="angle"/>
          <prop v="229,24,144,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="Styles/UK_traffic_sign_610_straight_on_only.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="10" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="angle" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="&quot;sign_azimuth&quot;" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <customproperties>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory penAlpha="255" sizeScale="3x:0,0,0,0,0,0" sizeType="MM" enabled="0" scaleDependency="Area" rotationOffset="270" penWidth="0" diagramOrientation="Up" height="15" minScaleDenominator="0" lineSizeScale="3x:0,0,0,0,0,0" penColor="#000000" barWidth="5" minimumSize="0" labelPlacementMethod="XHeight" backgroundColor="#ffffff" lineSizeType="MM" width="15" scaleBasedVisibility="0" opacity="1" maxScaleDenominator="1e+08" backgroundAlpha="255">
      <fontProperties style="" description="MS Shell Dlg 2,8.1,-1,5,50,0,0,0,0,0"/>
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
    <field name="restriction">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="from_osm_id">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="from_id">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="to_osm_id">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="to_id">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="sign_azimuth">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="id" name="" index="0"/>
    <alias field="restriction" name="" index="1"/>
    <alias field="from_osm_id" name="" index="2"/>
    <alias field="from_id" name="" index="3"/>
    <alias field="to_osm_id" name="" index="4"/>
    <alias field="to_id" name="" index="5"/>
    <alias field="sign_azimuth" name="" index="6"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="id" expression="" applyOnUpdate="0"/>
    <default field="restriction" expression="" applyOnUpdate="0"/>
    <default field="from_osm_id" expression="" applyOnUpdate="0"/>
    <default field="from_id" expression="" applyOnUpdate="0"/>
    <default field="to_osm_id" expression="" applyOnUpdate="0"/>
    <default field="to_id" expression="" applyOnUpdate="0"/>
    <default field="sign_azimuth" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint field="id" constraints="3" exp_strength="0" notnull_strength="1" unique_strength="1"/>
    <constraint field="restriction" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="from_osm_id" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="from_id" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="to_osm_id" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="to_id" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="sign_azimuth" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="id" exp="" desc=""/>
    <constraint field="restriction" exp="" desc=""/>
    <constraint field="from_osm_id" exp="" desc=""/>
    <constraint field="from_id" exp="" desc=""/>
    <constraint field="to_osm_id" exp="" desc=""/>
    <constraint field="to_id" exp="" desc=""/>
    <constraint field="sign_azimuth" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortExpression="" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column hidden="0" name="id" width="-1" type="field"/>
      <column hidden="0" name="restriction" width="-1" type="field"/>
      <column hidden="0" name="from_osm_id" width="-1" type="field"/>
      <column hidden="0" name="to_osm_id" width="-1" type="field"/>
      <column hidden="0" name="from_id" width="-1" type="field"/>
      <column hidden="0" name="to_id" width="-1" type="field"/>
      <column hidden="1" width="-1" type="actions"/>
      <column hidden="0" name="sign_azimuth" width="-1" type="field"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
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
    <field editable="1" name="car_cost"/>
    <field editable="1" name="from_attrs"/>
    <field editable="1" name="from_geom"/>
    <field editable="1" name="from_highway"/>
    <field editable="1" name="from_id"/>
    <field editable="1" name="from_name"/>
    <field editable="1" name="from_osm_id"/>
    <field editable="1" name="id"/>
    <field editable="1" name="restriction"/>
    <field editable="1" name="sign_azimuth"/>
    <field editable="1" name="to_attrs"/>
    <field editable="1" name="to_geom"/>
    <field editable="1" name="to_highway"/>
    <field editable="1" name="to_id"/>
    <field editable="1" name="to_name"/>
    <field editable="1" name="to_osm_id"/>
    <field editable="1" name="walk_cost"/>
  </editable>
  <labelOnTop>
    <field name="car_cost" labelOnTop="0"/>
    <field name="from_attrs" labelOnTop="0"/>
    <field name="from_geom" labelOnTop="0"/>
    <field name="from_highway" labelOnTop="0"/>
    <field name="from_id" labelOnTop="0"/>
    <field name="from_name" labelOnTop="0"/>
    <field name="from_osm_id" labelOnTop="0"/>
    <field name="id" labelOnTop="0"/>
    <field name="restriction" labelOnTop="0"/>
    <field name="sign_azimuth" labelOnTop="0"/>
    <field name="to_attrs" labelOnTop="0"/>
    <field name="to_geom" labelOnTop="0"/>
    <field name="to_highway" labelOnTop="0"/>
    <field name="to_id" labelOnTop="0"/>
    <field name="to_name" labelOnTop="0"/>
    <field name="to_osm_id" labelOnTop="0"/>
    <field name="walk_cost" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>id</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
